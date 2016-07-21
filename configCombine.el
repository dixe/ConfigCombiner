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

(defun directory-el-files (dir)
  (directory-files dir nil "\\.el$"))


(directory-el-files ".")

(get-file-content-lines "configCombine.el")

(defun remove-comment-lines (lines)
  (remove-if '(lambda (x) (string-match ";.+" x )) lines))

(remove-comment-lines (get-file-content-lines "configCombine.el"))

(defun write-to-file (list filename)
  (while list
    (append-to-file (car list) nil filename)
    (append-to-file "\n" nil filename)
    (setq list (cdr list))))


(write-to-file (remove-comment-lines (get-file-content-lines "configCombine.el")) ".emacs")


(defun write-all-config-to-file (path outfile)
  (let ((list (directory-el-files path)))
    (while list
      (write-to-file list outfile)
      (setq list (cdr list)))))


(write-all-config-to-file "." ".emacs")







;; replace \n with newlines
(defun replace-dash-n-nelwine ()
  (goto-char (point-min))
  (while (search-forward "\\n"  nil 't)
    (replace-match "\n")))

(replace-dash-n-nelwine)
