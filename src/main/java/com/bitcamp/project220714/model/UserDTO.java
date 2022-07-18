package com.bitcamp.project220714.model;

import lombok.Data;

import java.util.Objects;

@Data
public class UserDTO {
    private int id;
    private String username;
    private String password;
    private String nickname;
    private String phone;
    private String email;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDTO userDTO = (UserDTO) o;
        return id == userDTO.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
