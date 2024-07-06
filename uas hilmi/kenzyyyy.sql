CREATE DATABASE kenzyyyy;
USE kenzyyyy;

CREATE DATABASE kenzyyyy;
USE kenzyyyy;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255), -- Panjang hash sandi dapat disesuaikan
    role ENUM('Admin', 'User')
);

-- Insert minimal 3 data pengguna
INSERT INTO users (username, password, role) VALUES
('hilmi', 'akuganteng', 'Admin'),
('kenzy', 'akutampan', 'User'),
('tomi', 'naxganteng', 'User');

CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    full_name VARCHAR(100),
    birthdate DATE,
    bio TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data profil pengguna
INSERT INTO profiles (user_id, full_name, birthdate, bio) VALUES
(1, 'Hilmi Ahmad Kamil', '2005-05-16', 'ngopi.'),
(2, 'kenzy sa', '2005-05-10', 'Reading.'),
(3, 'tomi bin tom', '2003-01-01', 'life to  santai.');

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(200),
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data postingan
INSERT INTO posts (user_id, title, content) VALUES
(1, 'Hello, this is my first post', 'aku cerdas.'),
(2, 'mantap si tugas ini','ga DL gada inspirasi.'),
(3, 'butuh susu', 'ayo mabar.');

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    comment_text VARCHAR(1000),
    commented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert minimal 3 data komentar
INSERT INTO comments (post_id, user_id, comment_text) VALUES
(1, 2, 'aku kaya bangga.'),
(1, 3, 'never give up.'),
(2, 1, 'enjoy life.');

SELECT u.username, p.full_name, p.bio
FROM users u
JOIN profiles p ON u.id = p.user_id;

SELECT po.title, po.content, c.comment_text
FROM posts po
LEFT JOIN comments c ON po.post_id = c.post_id;
