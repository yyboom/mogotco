package com.mogotco.mapper;

import org.apache.ibatis.annotations.Mapper;

import org.springframework.stereotype.Repository;

import com.mogotco.dto.MWishcateDTO;
import com.mogotco.frame.MyMapper;

@Repository
@Mapper
public interface MWishcateMapper extends MyMapper<Integer, MWishcateDTO>{

}
