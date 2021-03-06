.PHONY: cover

BIN_PATH:=node_modules/.bin/

all:	bitcore-wallet-client-rapture.min.js

clean:
	rm bitcore-wallet-client.js
	rm bitcore-wallet-client.min.js

bitcore-wallet-client-rapture.js: index.js lib/*.js
	${BIN_PATH}browserify $< > $@

bitcore-wallet-client-rapture.min.js: bitcore-wallet-client-rapture.js
	uglify  -s $<  -o $@

cover:
	./node_modules/.bin/istanbul cover ./node_modules/.bin/_mocha -- --reporter spec test
