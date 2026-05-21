package com.idbi.Beans;

import java.util.HashMap;

public class QuestionBean {
	
	private int Question_id;
	private String Question;
	private String optionA;
	private String optionB;
	private String optionC;
	private String optionD;
	private String stream;
	private String correctOption;
	private String selectedOption;
	private HashMap<String,String> result = new HashMap<String,String>() ;
	
	public int getQuestion_id() {
		return Question_id;
	}
	public void setQuestion_id(int question_id) {
		Question_id = question_id;
	}
	public String getQuestion() {
		return Question;
	}
	public void setQuestion(String question) {
		Question = question;
	}
	public String getOptionA() {
		return optionA;
	}
	public void setOptionA(String optionA) {
		this.optionA = optionA;
	}
	public String getOptionB() {
		return optionB;
	}
	public void setOptionB(String optionB) {
		this.optionB = optionB;
	}
	public String getOptionC() {
		return optionC;
	}
	public void setOptionC(String optionC) {
		this.optionC = optionC;
	}
	public String getOptionD() {
		return optionD;
	}
	public void setOptionD(String optionD) {
		this.optionD = optionD;
	}
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	public String getCorrectOption() {
		return correctOption;
	}
	public void setCorrectOption(String correctOption) {
		this.correctOption = correctOption;
	}
	public String getSelectedOption() {
		return selectedOption;
	}
	public void setSelectedOption(String selectedOption) {
		this.selectedOption = selectedOption;
	}
	public HashMap<String, String> getResult() {
		return result;
	}
	public void setResult(HashMap<String, String> result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "QuestionBean [Question_id=" + Question_id + ", Question=" + Question + ", optionA=" + optionA
				+ ", optionB=" + optionB + ", optionC=" + optionC + ", optionD=" + optionD + ", stream=" + stream
				+ ", correctOption=" + correctOption + ", selectedOption=" + selectedOption + ", result=" + result
				+ "]";
	}
	

	
	
	

}
