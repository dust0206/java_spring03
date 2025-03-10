package com.example.spring03;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

// @Repository : 보통은 Repository로 정의 하나 여기서는 안해도 된다.
public interface MemoDAO {
	
	@Select("select * from memo order by idx desc")
	List<MemoDTO> list();
	
	@Insert("insert into memo (idx, writer, memo) values ( (select nvl(max(idx)+1, 1) from memo),#{writer}, #{memo})")
	public void insert(@Param("writer") String writer, @Param("memo") String memo );	// @Param("writer") - mybatis의 변수명
	
	@Select("select * from memo where idx=#{idx}")
	public MemoDTO view(@Param("idx") int idx);
	
	@Update("update memo set writer=#{writer},memo=#{memo} where idx=#{idx}")
	public void update(MemoDTO dto);
	
	@Delete("delete from  memo where idx=#{idx}")
	public void delete(@Param("idx") int idx);  
}
