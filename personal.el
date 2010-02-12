;;setting for special days
(setq calendar-holidays
      (append
       '(
		  (holiday-lunar 11 4 "�ְ�����")
		  (holiday-lunar 5 22 "��������")
		  (holiday-lunar 3 12 "�������")
		  (holiday-fixed 11 18 "�ݵ�����")
         )
       calendar-holidays))

(defun cal-china-date-month (lunar-month lunar-day)
  "Return the month this year

LUNAR-MONTH and LUNAR-DAY are date number used in chinese lunar
calendar."
  (interactive "nlunar month: \nnlunar day: ")
  (let* ((birthday-chinese (list lunar-month lunar-day))
	 (current-chinese-date (calendar-chinese-from-absolute
				(calendar-absolute-from-gregorian
				 (calendar-current-date))))
	 (cycle (car current-chinese-date))
	 (year (cadr current-chinese-date))
	 (birthday-chinese-full `(,cycle ,year ,@birthday-chinese))
	 (birthday-gregorian-full (calendar-gregorian-from-absolute
				   (calendar-absolute-from-chinese
				    birthday-chinese-full))))
	(setq ret (extract-calendar-month birthday-gregorian-full)))
	)

(defun cal-china-date-day (lunar-month lunar-day)
  "Return the day this year

LUNAR-MONTH and LUNAR-DAY are date number used in chinese lunar
calendar."
  (interactive "nlunar month: \nnlunar day: ")
  (let* ((birthday-chinese (list lunar-month lunar-day))
	 (current-chinese-date (calendar-chinese-from-absolute
				(calendar-absolute-from-gregorian
				 (calendar-current-date))))
	 (cycle (car current-chinese-date))
	 (year (cadr current-chinese-date))
	 (birthday-chinese-full `(,cycle ,year ,@birthday-chinese))
	 (birthday-gregorian-full (calendar-gregorian-from-absolute
				   (calendar-absolute-from-chinese
				    birthday-chinese-full))))
	(setq ret (extract-calendar-day birthday-gregorian-full)))
	)
