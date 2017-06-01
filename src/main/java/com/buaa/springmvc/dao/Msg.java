package com.buaa.springmvc.dao;


/**
 * @author theo
 *
 */
public class Msg {
    private int id;
    private String content;
    private String author;
    private String date;
    private int isprivate=0;



	public int getIsprivate() {
		return isprivate;
	}

	public void setIsprivate(int isprivate) {
		this.isprivate = isprivate;
	}

	public Msg() {
    }

    public Msg(String content, String author, String date) {
        this.content = content;
        this.author = author;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", author='" + author + '\'' +
                ", date='" + date + '\'' +
                ", isprivate='" + isprivate + '\'' +
                '}';
    }
}
