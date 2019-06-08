package model;

public class Product {
    private int id;
    private String name;
    private int price;
    private String detail;
    private String pictureUrl;

	public String getDetail() {
		return detail;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPictureUrl() {
		return pictureUrl;
	}

	public int getPrice() {
		return price;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
    
	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPictureUrl(String url) {
		pictureUrl = url;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
