/*
 *
 *  Create database users
 *
 */

-- User atomizer@localhost
CREATE USER IF NOT EXISTS
  'atomizer'@'localhost'
  IDENTIFIED BY 'atomizer_password';
GRANT SELECT 
  ON ep_newshub_rss.items
  TO 'atomizer'@'localhost';
GRANT INSERT
  ON eptwitter.*
  TO 'atomizer'@'localhost';

-- Flush privileges
FLUSH PRIVILEGES;
