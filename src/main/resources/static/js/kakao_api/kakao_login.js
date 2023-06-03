
//카카오로그인
function kakao_login() {
    Kakao.init('c5385b2bd1d614d808c86f0bb4257bc4');
    Kakao.isInitialized();
    Kakao.Auth.loginForm({

        success:
                function (response) {

                    Kakao.API.request({
                        url: '/v2/user/me',
                        success: function (response) {
                            console.log(response)
                            var account = JSON.parse(JSON.stringify(response.kakao_account));
                            var profile = JSON.parse(JSON.stringify(response.kakao_account.profile));

                            // 사용자가 이메일 동의를 하지 않았을 경우
                            if (!account.hasOwnProperty("email")) {
                                Kakao.API.request({
                                    url: '/v1/user/unlink',
                                    success: function (response) {
                                        console.log(response);
                                        alert('동의 항목을 전부 동의해주셔야 서비스 이용이 가능합니다.')
                                    },
                                    fail: function (error) {
                                        console.log(error);
                                    },
                                });
                                return;
                            }

                            const kakao_user = {
                                nickname: account.has_email == true ? account.email.split('@')[0] : "",
                                email: account.has_email == true ? account.email : "",
                                profile_image: profile.thumbnail_image_url,
                                //gender: account.gender == null ? null : account.gender,
                            }

                            // alert(kakao_user.nickname + " " + kakao_user.email + " " + kakao_user.profile_image + " " + kakao_user.clientKey);

                            login(kakao_user);
                        },
                        fail: function (error) {
                            console.log(error)
                            alert(error);
                        },
                    })
                },
        fail:
                function (error) {
                    console.log(error)
                    alert(error);
                },
    })
}

function login(kakao_user) {
    const url = "/battery/sign-in";

    fetch(url, {
        method: "GET",
        body: JSON.stringify(kakao_user),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(response => {
        if (response.ok) {
            // alert("로그인이 완료 되었습니다.");
            window.location.href = "/battery";
        }
    });
}

function kakao_logout() {
    if (!Kakao.Auth.getAccessToken()) {
        console.log('Not logged in.');
        return;
    }
    // Kakao.Auth.logout 으로 카카오 토큰 만료
    // 토큰 만료 후 세션 삭제
    Kakao.Auth.logout(function () {
        console.log(Kakao.Auth.getAccessToken());

        const url = "/api/user/logout";

        fetch(url, {
            method: "GET"
        }).then(response => {
            if (response.ok) {
                alert("로그아웃 완료");
                window.location.href = "/";
            } else {
                alert("로그아웃 실패");
            }
        });
    });
}