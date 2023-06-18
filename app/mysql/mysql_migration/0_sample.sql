-- `user` table indexes
ALTER TABLE `user`
ADD INDEX idx_user_mail_password (mail(200), password(100)),
ADD INDEX idx_user_goal (goal(191)),  -- goal列は長いのでプレフィックス長を制限
ADD INDEX idx_user_kana (kana),
ADD INDEX idx_user_name (user_name);

-- `department` table indexes
ALTER TABLE `department`
ADD INDEX idx_department_active (active);
-- `role` table indexes
ALTER TABLE `role`
ADD INDEX idx_role_active (active);

-- `department_role_member` table indexes
ALTER TABLE `department_role_member`
ADD INDEX idx_department_role_member_role_user_belong (role_id, user_id, belong);

ALTER TABLE match_group_member ADD INDEX user_id_index (user_id);

CREATE INDEX idx_entry_date_kana ON user (entry_date, kana);

-- ALTER TABLE user ADD FULLTEXT INDEX goal_index_with_parser (goal) WITH PARSER ngram;
-- SELECT user_id FROM user WHERE MATCH(goal) AGAINST ('+常務' IN BOOLEAN MODE);


--227 
--SELECT加えたら280まで増えた
-- -- FOREIGN KEY Constraints
-- -- FOREIGN KEY Constraints for `user` table
-- ALTER TABLE `user`
-- ADD FOREIGN KEY (office_id) REFERENCES office(office_id),
-- ADD FOREIGN KEY (user_icon_id) REFERENCES file(file_id);

-- -- FOREIGN KEY Constraints for `session` table
-- ALTER TABLE `session`
-- ADD FOREIGN KEY (linked_user_id) REFERENCES user(user_id);

-- -- FOREIGN KEY Constraints for `department_role_member` table
-- ALTER TABLE `department_role_member`
-- ADD FOREIGN KEY (department_id) REFERENCES department(department_id),
-- ADD FOREIGN KEY (role_id) REFERENCES role(role_id),
-- ADD FOREIGN KEY (user_id) REFERENCES user(user_id);

-- -- FOREIGN KEY Constraints for `match_group` table
-- ALTER TABLE `match_group`
-- ADD FOREIGN KEY (created_by) REFERENCES user(user_id);

-- -- FOREIGN KEY Constraints for `match_group_member` table
-- ALTER TABLE `match_group_member`
-- ADD FOREIGN KEY (match_group_id) REFERENCES match_group(match_group_id),
-- ADD FOREIGN KEY (user_id) REFERENCES user(user_id);

-- -- FOREIGN KEY Constraints for `skill_member` table
-- ALTER TABLE `skill_member`
-- ADD FOREIGN KEY (skill_id) REFERENCES skill(skill_id),
-- ADD FOREIGN KEY (user_id) REFERENCES user(user_id);


-- ALTER TABLE department_role_member ADD INDEX idx_department_role_member_department_id_user_id (department_id, user_id);
-- ALTER TABLE department_role_member ADD INDEX idx_department_role_member_role_id_belong (role_id, belong);
-- ALTER TABLE match_group_member ADD INDEX idx_match_group_member_user_id (user_id);
-- ALTER TABLE SYSTEM_USER ADD INDEX idx_system_user_mail_password (mail, password);

-- ALTER TABLE SYSTEM_USER ADD FULLTEXT (user_name);
-- ALTER TABLE SYSTEM_USER ADD FULLTEXT (kana);
-- ALTER TABLE SYSTEM_USER ADD FULLTEXT (mail);
