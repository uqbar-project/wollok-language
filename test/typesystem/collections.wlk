/** 
 * Tests generales a todas las collecciones
 *
 * Si bien los tests en esta clase son comunes a todas las colecciones, Wollok no podría tiparlo genericamente.
 * Para testear tanto lists como sets, esta clase está duplicada, salvo por la declaración de `sample`. 
 */	
class TestCollection {
	@Expect(type="List<Number>")
	const sample = [1, 2, 3]
	@Expect(type="List<String>")
	const property strings = ["wo", "llok"]

	method generalCollection() {
		// @Expect(type="List<Number>")
		const asList = sample.asList()
		
		// @Expect(type="Set<Number>")
		const asSet = sample.asSet()
		
		// @Expect(type="Boolean")
		const isEmpty = sample.isEmpty()
		
		// @Expect(type="String")
		const toStringPrefix = sample.toStringPrefix()
		
		// @Expect(type="String")
		const toStringSuffix = sample.toStringSuffix()
		
		// @Expect(type="{(Number) => Boolean}")
		const contains = { e => sample.contains(e) }
	
		// @Expect(type="{(Number) => Number}")
		const occurrencesOf = { e => sample.occurrencesOf(e) }

		// @Expect(type="{() => Number}")
		const size = { sample.size() }

		// @Expect(type="{() => Number}")
		const anyOne = { sample.anyOne() }

		@Expect(type="{ (Number) => Void }")
		const add = { e => sample.add(e) }

		// @Expect(type="{(Number) => Void}")
		const remove = { e => sample.remove(e) }

		// @Expect(type="{(Collection<Number>) => Void}")
		const addAll = { l => sample.addAll(l) }

		// @Expect(type="{(Collection<Number>) => Void}")
		const removeAll = { l => sample.removeAll(l) }
		
		// @Expect(type="{() => Void}")
		const clear = { sample.clear() }
		
		// @Expect(type="{() => String}")
		const join = { sample.join() }
		
		// @Expect(type="{(String) => String}")
		const joinSeparator = { separator => sample.join(separator) }
	}

	method basicClosures() {
		// @Expect(type="{({(Number) => Void}) => Void}")
		const forEach = { action => sample.forEach(action) } 

		// @Expect(type="{({(Number) => Boolean}) => List<Number>}")
		const filter = { cond => sample.filter(cond) } 

		// @Expect(type="{({(Number) => Boolean}) => Number}")
		const find = { predicate => sample.find(predicate) }

		// @Expect(type="{({(Number) => Boolean}, Number) => Number}")
		const findOrDefault = { predicate, defaultValue => sample.findOrDefault(predicate, defaultValue) }

		// @Expect(type="{({(Number) => Boolean}, {() => Number}) => Number}")
		const findOrElse = { predicate, actionIfAbsent => sample.findOrElse(predicate, actionIfAbsent) }

		// @Expect(type="{({(Number) => Boolean}) => Void}")
		const removeAllSuchThat = { closure => sample.removeAllSuchThat(closure) }

		// @Expect(type="{({(Number) => Boolean}) => Boolean}")
		const all = { predicate => sample.all(predicate) }

		// @Expect(type="{({(Number) => Boolean}) => Boolean}")
		const any = { predicate => sample.any(predicate) }

		// @Expect(type="{({(Number) => Boolean}) => Number}")
		const count = { predicate => sample.count(predicate)}
	}
	
	method comparableCollection() {
		// @Expect(type="{() => String}")
		const min = { strings.min() }
		
		// @Expect(type="{({(String) => (Date|Number|String)}) => String}")
		const minComparable = { comparable => strings.min(comparable) }
		
		// @Expect(type="{({() => String}) => String}")
		const minIfEmpty = { ifEmpty => strings.minIfEmpty(ifEmpty) }
		
		// @Expect(type="{({(String) => (Date|Number|String)}, {() => String}) => String}")
		const minIfEmptyComparable = { comparable, ifEmpty => strings.minIfEmpty(comparable, ifEmpty) }
		
		
		// @Expect(type="{() => String}")
		const max = { strings.max() }
		
		// @Expect(type="{({(String) => (Date|Number|String)}) => String}")
		const maxComparable = { comparable => strings.max(comparable) }
		
		// @Expect(type="{({() => String}) => String}")
		const maxIfEmpty = { ifEmpty => strings.maxIfEmpty(ifEmpty) }
		
		// @Expect(type="{({(String) => (Date|Number|String)}, {() => String}) => String}")
		const maxIfEmptyComparable = { comparable, ifEmpty => strings.maxIfEmpty(comparable, ifEmpty) }
		
		
		// @Expect(type="{({(String, String) => Boolean}) => List<String>}")
		const sortedBy = { predicate => strings.sortedBy(predicate) }
		
		
		// @Expect(type="{({(String) => (Date|Number|String)}, {((Date|Number|String), (Date|Number|String)) => Boolean}, {() => String}) => String}")
		const absolute = { comparable, criteria, ifEmpty => strings.absolute (comparable, criteria, ifEmpty) }
		
	}
	
	method sumableCollection() { 
		// @Expect(type="{() => Number}")
		const sum = { sample.sum() }
		
		// @Expect(type="{({(String) => Number}) => Number}")
		const sumProjection = { projection => strings.sum(projection) }
	}
	
	method methodScopedTypeParameters() {
		@Expect(type="List<Boolean>")
		const mapped = sample.map { number => number.even() } 

		// @Expect(type="List<Boolean>")
		const flatMapped = sample.flatMap { number => [number.even()] } 

		@Expect(type="Number")
		const fold = sample.fold(0, { accum, elem => accum + elem }) 

		@Expect(type="Boolean")
		const allEven = sample.fold(true, { accum, elem => accum && elem.even() }) 
	}
}

/**
 * Tests de métodos específicos de listas, 
 * o bien aquellos que devuelven un tipo distinto dependiendo del receptor (e.g. filter)
 */
class TestList {
	@Expect(type="List<Number>")
	const list = [1, 2, 3]

	method listSpecific() {
		// @Expect(type="Number")
		const first = list.first()
		
		// @Expect(type="Number")
		const head = list.head()
		
		// @Expect(type="Number")
		const last = list.last()
		
		// @Expect(type="List<Number>")
		const reverse = list.reverse()
		
		// @Expect(type="List<Number>")
		const withoutDuplicates = list.withoutDuplicates()
		
		// @Expect(type="{ (Number) => Number }")
		const get = { i => list.get(i) }
		
		// @Expect(type="{ (Number) => List<Number> }")
		const take = { n => list.take(n) }
		
		// @Expect(type="{ (Number) => List<Number> }")
		const drop = { n => list.drop(n) }
		
		// @Expect(type="{ (Number, Number) => List<Number> }")
		const subList = { start, end => list.subList(start, end) }
		
		// @Expect(type="{ ({(Number, Number) => Boolean}) => Void }")
		const sortBy = { predicate => list.sortBy(predicate) }
	}

	method selfTypedList() {
		// @Expect(type="{({(Number) => Boolean}) => List<Number>}")
		const filterList = { cond => list.filter(cond) }

		// @Expect(type="{(Collection<Number>) => List<Number>}")
		const plusList = { c => list + c }
		
		// @Expect(type="List<Number>")
		const copyList = list.copy()
		
		// @Expect(type="List<Any>")
		const newInstanceList = list.newInstance()

		// @Expect(type="{() => List<Number>}")
		const flattenList = { [list].flatten() }
	}			
}


/**
 * Tests de métodos específicos de listas, 
 * o bien aquellos que devuelven un tipo distinto dependiendo del receptor (e.g. filter)
 */
class SetList {
	@Expect(type="Set<Number>")
	const set = #{1, 2, 3}

	method setSpecific() {
		// @Expect(type="{(Collection<Number>) => Set<Number>}")
		const union = { col => set.union(col) }
		
		// @Expect(type="{(Collection<Number>) => Set<Number>}")
		const intersection = { col => set.intersection(col) }
		
		// @Expect(type="{(Collection<Number>) => Set<Number>}")
		const difference = { col => set.difference(col) }
	}

	method selfTypedSet() {
		// @Expect(type="{({(Number) => Boolean}) => Set<Number>}")
		const filterSet = { cond => set.filter(cond) }

		// @Expect(type="{(Collection<Number>) => Set<Number>}")
		const plusSet = { c => set + c }
		
		// @Expect(type="Set<Number>")
		const copySet = set.copy()
		
		// @Expect(type="Set<Any>")
		const newInstanceSet = set.newInstance()

		// @Expect(type="{() => Set<Number>}")
		const flattenSet = { #{set}.flatten() }
	}
}