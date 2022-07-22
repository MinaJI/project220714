package com.bitcamp.project220714.model;

import lombok.Data;

import java.util.Objects;

@Data
public class ProductsDTO {
    private int id;
    private String name;
    private int price;
    private String category;
    private String info;
    private String imgPath;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductsDTO that = (ProductsDTO) o;
        return id == that.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
