package com.project.battery.service;

import com.project.battery.dto.*;
import com.project.battery.entity.User;
import com.project.battery.repository.UserRepository;
import java.util.Objects;
import java.util.UUID;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author host
 */
@Slf4j
@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Transactional
    public UserDto login(UserLoginDto userLoginDto) {
        log.info(userLoginDto.toString());
        // 유저 정보 조회
        User user = userRepository.findById(userLoginDto.getEmail()).orElse(null);

        // 신규 유저면 DB에 등록
        if (Objects.isNull(user)) {
            // 최초 회원가입 시 clientKey 생성
            userLoginDto.setClientKey(UUID.randomUUID().toString().substring(0, 8));
            user = userRepository.save(User.toEntity(userLoginDto));
        }

        // 유저 정보 리턴
        return UserDto.createUserDto(user);
    }

    // 프로필(내 정보) 가져오기
    public UserDto getProfile(String nickname) {
        User user = userRepository.findByNickname(nickname)
                .orElseThrow(() -> new IllegalArgumentException("유저 정보 조회 오류"));

        return UserDto.createUserDto(user);
    }
}
