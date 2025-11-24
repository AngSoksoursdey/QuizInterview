
CREATE TABLE staffs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    sex ENUM('M','F') NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE positions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    staff_id INT NOT NULL,
    position VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    FOREIGN KEY (staff_id) REFERENCES staffs(id)
);

