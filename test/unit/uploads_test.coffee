Uploads = require '../../lib/uploads'
Upload = require '../../lib/upload'

should = require 'should'

describe 'Uploads', ->
	$ = {}
	beforeEach ->
		$.uploads = new Uploads
		$.upload = new Upload
	describe 'add', ->
		it 'should add without upload', ->
			upload = $.uploads.add 1
			should.exist upload
		it 'should add and get a new upload', ->
			$.uploads.add 1, $.upload
			$.uploads.get(1).should.equal $.upload
	describe 'get', ->
		it 'should return nil if the upload does not exist', ->
			should.not.exist $.uploads.get(1)
	describe 'remove', ->
		it 'should remove an upload', ->
			$.uploads.add 1, $.upload
			$.uploads.remove 1
			should.not.exist $.uploads.get(1)