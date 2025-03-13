package model;

/**
 *
 * @author tranh
 */
public class Products {
    private int id;
    private String name;
    private double price;
    private int quantity;
    private String description;
    private String image;
    private String createdAt;
    private String updateddAt;
    private Categories category;
    private int status;

    public Products() {
    }

    public Products(int id, String name, double price, int quantity, String description, String image, String createdAt, String updateddAt, Categories category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.image = image;
        this.createdAt = createdAt;
        this.updateddAt = updateddAt;
        this.category = category;
    }

    public Products(String name, double price, int quantity, String description, String image, String updateddAt, Categories category) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.image = image;
        this.updateddAt = updateddAt;
        this.category = category;
    }

    public Products(int id, String name, double price, int quantity, String description, String image, String createdAt, String updateddAt, Categories category, int status) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.description = description;
        this.image = image;
        this.createdAt = createdAt;
        this.updateddAt = updateddAt;
        this.category = category;
        this.status = status;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUpdateddAt() {
        return updateddAt;
    }

    public void setUpdateddAt(String updateddAt) {
        this.updateddAt = updateddAt;
    }

    public Categories getCategory() {
        return category;
    }

    public void setCategory(Categories category) {
        this.category = category;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
}
