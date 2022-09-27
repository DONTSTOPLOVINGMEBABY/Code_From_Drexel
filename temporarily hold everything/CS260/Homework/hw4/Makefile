PY = python3

	# this is a gnu-extension.  Don't worry about it.  Delete it, if you're
	# not using gnu-make
.PHONY : run test_post post

run : test_post

	# we need this target to grade.  We will supply our own input.
post : post.py
	$(PY) post.py

test_post : post.py
	$(PY) post.py < sample-post.input
