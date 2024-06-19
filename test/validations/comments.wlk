object pepita {
    @NotExpect(code="malformedMember")
    method doNothing() {
        // THIS COMMENT DOES NOT BREAK THE PARSER
    }
}

@NotExpect(code="malformedEntity")
// Comment 1
/*
    Comment 2
*/
// Comment 3