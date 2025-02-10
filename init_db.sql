-- Створюємо таблицю для працівників
CREATE TABLE worker (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(1000) NOT NULL CHECK (LENGTH(name) >= 2),
    birthday DATE NOT NULL CHECK (YEAR(birthday) > 1900),
    level ENUM('Trainee', 'Junior', 'Middle', 'Senior') NOT NULL,
    salary INT NOT NULL CHECK (salary BETWEEN 100 AND 100000)
);

-- Створюємо таблицю для клієнтів
CREATE TABLE client (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(1000) NOT NULL CHECK (LENGTH(name) >= 2)
);

-- Створюємо таблицю для проєктів
CREATE TABLE project (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    start_date DATE NOT NULL,
    finish_date DATE NOT NULL,
    FOREIGN KEY (client_id) REFERENCES client(id)
);

-- Створюємо таблицю для зв'язків працівників і проєктів
CREATE TABLE project_worker (
    project_id INT NOT NULL,
    worker_id INT NOT NULL,
    PRIMARY KEY (project_id, worker_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);