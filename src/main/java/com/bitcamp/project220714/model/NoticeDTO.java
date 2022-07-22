package com.bitcamp.project220714.model;

import lombok.Data;

import java.sql.Time;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Objects;

@Data
public class NoticeDTO {
    private int id;
    private int writerId;
    private String title;
    private String content;
    private Calendar writtenDate;
    private Calendar updatedDate;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        NoticeDTO noticeDTO = (NoticeDTO) o;
        return id == noticeDTO.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public void setWrittenDate(Timestamp writtenDate) {
        this.writtenDate = Calendar.getInstance();
        this.writtenDate.setTime(writtenDate);
    }

    public void setUpdatedDate(Timestamp updatedDate) {
        this.updatedDate = Calendar.getInstance();
        this.updatedDate.setTime(updatedDate);
    }
}
