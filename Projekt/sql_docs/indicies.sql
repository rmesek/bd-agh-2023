‘Indeks service_types ‘- JM 

Oddaje nam indeksy typów usług 

CREATE INDEX service_types 
ON service_types (service_type_id,service_type_name); 

 

‘Indeks studies_limatation ‘- JM 

Indeks odpowiedzialny za ilość miejsc na danym kierunku studiów 

CREATE INDEX studies_limitation 
ON studies (studies_id,student_limit); 

 

‘Indeks teacher_for_studies‘- JM 

Indeks odpowiedzialny za nauczycieli dla danej klasy na danym kierunku studiów 

CREATE INDEX teacher_for_studies 
ON studies_classes (studies_id,class_id,teacher_id); 

 

‘Indeks teacher_for_webinars‘- JM 

Indeks odpowiedzialny za nauczycieli dla danego webinaru 

CREATE INDEX teacher_for_webinars 
ON webinars (webinar_id,teacher_id); 

 

 

‘Indeks teacher_language‘- JM 

Indeks odpowiedzialny za nauczycieli i przypisane im id języka 

CREATE INDEX teacher_language 
ON translators (teacher_id,language_id); 

 

‘Indeks studies_practice‘- JM 

Indeks odpowiedzialny za studia i praktyki przypisane do kierunku 

CREATE INDEX studies_practice 
ON studies_practice_modules (studies_id,practice_id); 

 

‘Indeks user_adress‘- JM 

Indeks odpowiedzialny za adress użytkownika 

CREATE INDEX user_adress 
ON adress_details (user_id,street,number,zip,city,country); 

 

‘Indeks user_login‘- JM 

Indeks odpowiedzialny za dane logowania danego użytkownika 

CREATE INDEX user_login 
ON users (user_id,e_mail,hashed_password); 

 

‘Indeks user_contact‘- JM 

Indeks odpowiedzialny za metody kontaktu z danym użytkownikiem 

CREATE INDEX user_contact 
ON users (user_id,e_mail,phone_number); 

 

‘Indeks com_inf‘- JM 

Indeks odpowiedzialny za informacje completnych płątności 

CREATE INDEX com_inf 
ON completed_payments (order_id,payment_amount,payment_time); 

 

‘Indeks course_list‘- JM 

Indeks odpowiedzialny za listę kursów 

CREATE INDEX course_list 
ON courses (course_id,title,subject_name); 

 

‘Indeks webinar_list‘- JM 

Indeks odpowiedzialny za listę webinarów 

CREATE INDEX webinar_list 
ON webinars (webinar_id,title,subject_name); 

 

‘Indeks studie_list‘- JM 

Indeks odpowiedzialny za listę kiernków studiów 

CREATE INDEX studie_list 
ON studies (studies_id,name); 

 

‘Indeks practice_list‘- JM 

Indeks odpowiedzialny za listę praktyk na konkretnym kierunku 

CREATE INDEX practice_list 
ON studies_practice_modules (studies_id,practice_id,company_name); 

 

‘Indeks course_module_list‘- JM 

Indeks odpowiedzialny za listę modułów dla danego kursu 

CREATE INDEX course_module_list 
ON course_modules (course_id,module_id,module_title); 

 

‘Indeks pending_pay‘- JM 

Indeks odpowiedzialny za listę nie zapłąconych orderów w raz z ich kwotą i czasem do spłącenia 

CREATE INDEX pending_pay 
ON pending_payments (order_id,payment_amount,payment_due); 