CREATE INDEX idx_article_title ON Articles(title);
CREATE INDEX idx_author_name_email ON Authors(name, email);
CREATE INDEX idx_comment_text_prefix ON Comments(comment_text(20));
