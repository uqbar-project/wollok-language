object dateTests {

	@Expect(type="() => Date")
	method m1() = new Date()

	@Expect(type="(Number) => Date")
	method m2(aDay) = new Date(day = aDay, month = 1, year = 2018)

	@Expect(type="(Number) => Date")
	method m4(days) = new Date().plusDays(days)

	@Expect(type="(Number) => Date")
	method m6(months) = new Date().plusMonths(months)

	@Expect(type="(Number) => Date")
	method m7(years) = new Date().plusYears(years)

	@Expect(type="(Date) => Boolean")
	method m8(_date) = _date.isLeapYear()

	@Expect(type="(Date) => Boolean")
	method m9(_date) = _date.isLeapYear()

	@Expect(type="(Date) => Number")
	method m10(_date) = _date.day() + _date.internalDayOfWeek() + _date.month() + _date.year()

	@Expect(type="(Date) => Date")
	method m11(_date) = _date.minusYears(1)

	@Expect(type="(Date) => Date")
	method m12(_date) = _date.minusMonths(1)

	@Expect(type="(Date) => Date")
	method m13(_date) = _date.minusDays(1)

	@Expect(type="(Date) => Boolean")
	method m14(_date) = _date < new Date()

	@Expect(type="(Date) => Boolean")
	method m15(_date) = _date <= new Date()

	@Expect(type="(Date) => Boolean")
	method m16(_date) = _date > new Date()

	@Expect(type="(Date) => Boolean")
	method m17(_date) = _date >= new Date()

	@Expect(type="(Date, Date) => Boolean")
	method m18(_date, _date1) = _date.between(_date1, new Date())

	@Expect(type="(Date) => Number")
	method m20(_date) = _date.day() + _date.internalDayOfWeek() + _date.month() + _date.year()

}
