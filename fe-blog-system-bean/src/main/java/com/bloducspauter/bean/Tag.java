package com.bloducspauter.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.mysql.cj.xdevapi.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.io.Serializable;


@NoArgsConstructor
@AllArgsConstructor
@Data
@TableName
public class Tag implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer tagId;
    private String name;
}
