using Pkg; Pkg.add("AbstractAlgebra")

struct lattice:
	public generators
	lattice(array, vectorspace):
		check_linear_independance()
		generators = array
	lattice(array,vectorspace,allow_linear_dep):
		if allow_linear_dep==True:
			run_snf(array)
			array =array
		generators=array
	is_equal(other_lattice::lattice):
		if len(generators)!== len(other_lattice.generators):
			return False
		F=free_module(ZZ,len(generators))
		L1, f1 = sub(F,generators)
		L2, f2 = sub(F, other_lattice.generators)
		intersection = F.intersect(L1,L2)
		return (L1==F.intersect(L1,L2))&&(L2==F.intersect(L1,L2))
