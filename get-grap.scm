#!/usr/bin/env gosh
(use srfi-1)
(use file.util)

(define (file->list file)
  (with-input-from-file file
    (lambda ()
      (port-map
       (lambda (line)
         line)
       read-line))))

(define (part-of-list start-reg end-reg lis)
  (let ((read-flag #f))
    (filter (lambda (line)
              (cond ((start-reg line) (set! read-flag #t) #f)
                    ((end-reg line) (set! read-flag #f)   #f)
                    (#t read-flag)))
            lis)))

(define (basename file-name)
  (receive (d f e) (decompose-path file-name)
    f))

(define (main args)
  (let ((file (second args)))
    (guard (e (else (print file)))
      (let ((fbase (basename file)))
        (with-output-to-file (string-append "./" fbase ".dat")
          (lambda ()
            (for-each print

                      (drop (part-of-list
                             #/^x$/
                             #/^y$/
                             (file->list file))
                            3))))))))


