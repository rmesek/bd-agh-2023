--CREATE INDEX studies_limitation
--ON studies (studies_id,student_limit);

SELECT s.studies_id, student_limit FROM studies s
JOIN studies_classes sc ON sc.studies_id=s.studies_id


--CREATE INDEX teacher_for_studies
--ON studies_classes (studies_id,class_id,teacher_id);
select studies_id,class_id,teacher_id from studies_classes

--CREATE INDEX com_inf
--ON completed_payments (order_id,payment_amount,payment_time);
select order_id,payment_amount,payment_time from completed_payments

--CREATE INDEX pending_pay
--ON pending_payments (order_id,payment_amount,payment_due);
select order_id,payment_amount,payment_due from pending_payments