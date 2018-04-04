package qna.model.vo;

public class QNA {
	private int qna_num;
	private String qna_question;
	private String qna_answer;
	
	public QNA(){
		
	}

	public QNA(int qna_num, String qna_question, String qna_answer) {
		super();
		this.qna_num = qna_num;
		this.qna_question = qna_question;
		this.qna_answer = qna_answer;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getQna_question() {
		return qna_question;
	}

	public void setQna_question(String qna_question) {
		this.qna_question = qna_question;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	
}
