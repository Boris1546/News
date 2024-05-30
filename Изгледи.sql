CREATE VIEW AuthorArticlesView AS
SELECT a.author_id, a.name, art.article_id, art.title, art.published_at
FROM Authors a
JOIN Articles art ON a.author_id = art.author_id;
CREATE VIEW ArticleCommentsView AS
SELECT art.article_id, art.title, c.comment_id, c.comment_text, c.created_at
FROM Articles art
JOIN Comments c ON art.article_id = c.article_id;
CREATE VIEW ArticleTagsView AS
SELECT art.article_id, art.title, t.tag_id, t.name AS tag_name
FROM Articles art
JOIN ArticleTags at ON art.article_id = at.article_id
JOIN Tags t ON at.tag_id = t.tag_id;
