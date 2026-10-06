-- assigning project to senior most employee (advance)
SELECT first_name, last_name, title, levels, email
 FROM music_store_project.employee
 order by cast(substring(levels, 2) as unsigned) desc limit 1;
 