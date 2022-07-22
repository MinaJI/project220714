package com.bitcamp.project220714.service;

import com.bitcamp.project220714.model.ProductsDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
@Service
public class ProductsService {
    private final String NAMESPACE = "mapper.ProductsMapper";

    @Autowired
    SqlSession sqlSession;

    public void insert(ProductsDTO p) {
        sqlSession.insert(NAMESPACE + ".insert", p);
    }

    public List<ProductsDTO> selectAll() {
        return sqlSession.selectList(NAMESPACE + ".selectAll");
    }

    public ProductsDTO selectOne(int id) {
        return sqlSession.selectOne(NAMESPACE + ".selectOne", id);
    }
}
