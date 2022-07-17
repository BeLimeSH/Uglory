package edu.kh.ugloryC.review.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ReviewSelectInfo {
	
	private int reviewTotalCount;
	private int starAvg;
	private int myReviewCount;
	private int unWritten;
	
	private int reviewCode;
	
	private int reviewNo;
	private String reviewContent;
	private String reviewEnrollDate;
	private int starRating;
	
	private int memberNo;
	private String memberName;

}