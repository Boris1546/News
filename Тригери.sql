CREATE TRIGGER before_article_insert
BEFORE INSERT ON Articles
FOR EACH ROW
BEGIN
    IF NEW.title IS NULL OR NEW.content IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Title and content cannot be NULL';
    END IF;
END;
CREATE TRIGGER after_comment_insert
AFTER INSERT ON Comments
FOR EACH ROW
BEGIN
    INSERT INTO Notifications (user_id, message)
    VALUES (NEW.user_id, 'New comment added to your article');
END;
CREATE TRIGGER before_author_update
BEFORE UPDATE ON Authors
FOR EACH ROW
BEGIN
    IF NEW.email NOT LIKE '%_@__%.__%' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid email format';
    END IF;
END;
CREATE TRIGGER after_article_update
AFTER UPDATE ON Articles
FOR EACH ROW
BEGIN
    INSERT INTO ArticleEditHistory (article_id, edit_time)
    VALUES (NEW.article_id, NOW());
END;
