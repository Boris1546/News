START TRANSACTION;

-- Insert a new article
INSERT INTO Articles (author_id, title, content) VALUES (1, 'Breaking News', 'Content of the breaking news');

-- Get the last inserted article_id
SET @last_article_id = LAST_INSERT_ID();

-- Assign a category to the article
INSERT INTO ArticleCategories (article_id, category_id) VALUES (@last_article_id, 1);

-- Assign a tag to the article
INSERT INTO ArticleTags (article_id, tag_id) VALUES (@last_article_id, 1);

-- Commit the transaction
COMMIT;
