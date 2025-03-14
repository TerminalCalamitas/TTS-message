CREATE TABLE streamer_messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    streamer_name VARCHAR(255),
    message_type CHAR(1) CHECK (message_type IN ('a', 'b', 'c')),
    message TEXT
);

INSERT INTO streamer_messages (streamer_name, message_type, message)
VALUES
    ('Doug', 'a', 'Hey Doug, I\'m worried that our friendship is only parasocial, can you acknowledge this message so that it isn\'t anymore?'),
    ('Doug', 'b', 'Yay Doug, I\'m worrisome that our fridenship is only parasocial, can you acknowledge this message so that it isn\'t anymore?'),
    ('Doug', 'c', 'Hey Doug, I\'m worried that our friendship is only parasocial, can you acknowledge this message so that it isn\'t anymore? (OMEGALUL) You\'re blonde, bald, bad at 2d platformers, pissing in a toilet costume, shit king, poggies, dougina');


DELIMITER $$

CREATE PROCEDURE GetStreamerMessage(IN streamer_name VARCHAR(255), IN message_type CHAR(1))
BEGIN
    DECLARE final_streamer_name VARCHAR(255);
    DECLARE final_message_type CHAR(1);
    
    SET final_streamer_name = COALESCE(streamer_name, 'Doug');
    SET final_message_type = COALESCE(message_type, 'a');
    
    SELECT message
    FROM streamer_messages
    WHERE streamer_name = final_streamer_name 
      AND message_type = final_message_type;
END $$

DELIMITER ;

CALL GetStreamerMessage('Parkzer', 'b');

CALL GetStreamerMessage('Doug', 'a');
