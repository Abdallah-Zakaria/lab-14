-- Create table name it authors in our database the have two columns and the id columns is the primary
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));

-- Insert all name of authors thst come from books into column name in author table
INSERT INTO authors(name) SELECT DISTINCT author FROM books;

-- Add new column in books table that represent the id of author of the book, 
ALTER TABLE books ADD COLUMN author_id INT;

-- This command will add a id of the author inside the author-id column - books table, 
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;

-- After we add the author_id inside the books table now no need for it we need to delete it.
ALTER TABLE books DROP COLUMN author;

-- Here we make the SQL know that the column author_id in table books is a foreign key that represent author table.
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);