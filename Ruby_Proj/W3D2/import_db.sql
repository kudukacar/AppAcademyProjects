
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname VARCHAR(255) NOT NULL,
    lname VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER,

    FOREIGN KEY(author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER,
    user_id INTEGER,

    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS replies;
CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    parent_id INTEGER,
    question_id INTEGER,
    author_id INTEGER,
    body TEXT NOT NULL,
    subject_question TEXT NOT NULL,

    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(parent_id) REFERENCES replies(id),
    FOREIGN KEY(author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_likes;
CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    question_id INTEGER,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)
);

INSERT INTO
    users(fname, lname)
VALUES
    ('atticus', 'finch'),
    ('harper', 'lee');

INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('html', 'what does html stand for', (SELECT id FROM users WHERE lname = 'finch')),
    ('ruby', 'who named ruby', (SELECT id FROM users WHERE lname = 'lee'));

INSERT INTO
    replies(parent_id, question_id, author_id, body, subject_question)
VALUES
    (NULL,(SELECT id FROM questions WHERE title = 'html'),(SELECT id FROM users WHERE lname = 'finch'), 'hypertest markup language', 'html'),
    (NULL,(SELECT id FROM questions WHERE title = 'ruby'), (SELECT id FROM users WHERE lname = 'lee'), 'Yukihiro Matsumoto', 'ruby');

INSERT INTO 
    question_likes(user_id, question_id)
VALUES
    ((SELECT id FROM users WHERE lname = 'finch'), (SELECT id FROM questions WHERE title = 'html')),
    ((SELECT id FROM users WHERE lname = 'lee'), (SELECT id FROM questions WHERE title = 'ruby'));
