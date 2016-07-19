;;
;;
;;
;;

(defun get-file-content (filename)
  (with-temp-buffer
    (insert-file-contents filename)
    (buffer-string)))


(defun get-file-content-lines (filename)
  (with-temp-buffer
    (insert-file-contents filename)
    (split-string (buffer-string) "\n" t)))



(get-file-content-lines "configCombine.el")
