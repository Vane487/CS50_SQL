-- Індекс для прискорення пошуку студентів за їхніми записами на курси
CREATE INDEX "enrollments_student_id" ON "enrollments" ("student_id");

-- Індекс для пошуку зарахувань за ID курсу
CREATE INDEX "enrollments_course_id" ON "enrollments" ("course_id");

-- Індекс для пошуку курсів за семестром, департаментом та номером
CREATE INDEX "courses_department_number_semester" ON "courses" ("department", "number", "semester");

-- Індекс для пошуку відповідностей вимог за requirement_id
CREATE INDEX "satisfies_requirement_id" ON "satisfies" ("requirement_id");
