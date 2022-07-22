package com.bitcamp.project220714.service;

import com.bitcamp.project220714.model.NoticeDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Repository
@Service
public class NoticeService {
    private final String NAMESPACE = "mapper.NoticeMapper";

    @Autowired
    SqlSession sqlSession;
    private final int PAGE_SIZE = 15;

    public List<NoticeDTO> selectAll(int pageNo) {
        HashMap<String, Integer> map = new HashMap<>();
        int startNum = (pageNo - 1) * PAGE_SIZE;
        map.put("startNum", startNum);
        map.put("PAGE_SIZE", PAGE_SIZE);
        return sqlSession.selectList(NAMESPACE + ".selectAll", map);
    }

    public NoticeDTO selectOne(int id) {
        return sqlSession.selectOne(NAMESPACE + ".selectOne", id);
    }

    public int selectLastPage() {
        int total = sqlSession.selectOne(NAMESPACE+".count");
        if(total % PAGE_SIZE == 0) {
            return total / PAGE_SIZE;
        } else {
            return (total / PAGE_SIZE) + 1;
        }
    }

    public void insert(NoticeDTO n) {
        sqlSession.insert(NAMESPACE + ".insert", n);
    }
}
