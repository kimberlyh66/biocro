#include <R.h>
#include <Rmath.h>
#include <Rinternals.h>
#include "c3photo.h"

SEXP c3photo(SEXP Qp1, SEXP Tl1, SEXP RH1, SEXP VCMAX, SEXP JMAX,
	     SEXP RD, SEXP CA, SEXP B0, SEXP B1, SEXP OX2, SEXP THETA,SEXP STOMWS, SEXP WS)
{
	struct c3_str tmp = {0,0,0,0};

	double Qp, Tl, RH, Catm;
	double Bet0,Bet1;

    // double Ca; unused
	double vcmax, jmax, Rd, O2, theta,StomWS;

	vcmax = REAL(VCMAX)[0];
	jmax = REAL(JMAX)[0];
	Bet0 = REAL(B0)[0];
	Bet1 = REAL(B1)[0];
	Rd = REAL(RD)[0];
	O2 = REAL(OX2)[0];
	theta = REAL(THETA)[0];
	StomWS = REAL(STOMWS)[0];
    // int nr; unused
    // int nt; unused
	int nq , i;
	int ws = INTEGER(WS)[0];
	SEXP lists, names;
	SEXP GsV;
	SEXP ASSV;
	SEXP CiV;

	nq = length(Qp1);
    // nt = length(Tl1); unused
    // nr = length(RH1); unused

	PROTECT(lists = allocVector(VECSXP,3));
	PROTECT(names = allocVector(STRSXP,3));

	PROTECT(GsV = allocVector(REALSXP,nq));
	PROTECT(ASSV = allocVector(REALSXP,nq));
	PROTECT(CiV = allocVector(REALSXP,nq));

	// Ca = REAL(CA)[0]; /* partial pressure of CO2 at the leaf surface */ unused
 
	/* Start of the loop */
	for(i = 0; i < nq ; i++)
	{
		/*pick the right element*/
		Qp = REAL(Qp1)[i];
		Tl = REAL(Tl1)[i];
		RH = REAL(RH1)[i];
		Catm = REAL(CA)[i];

		tmp = c3photoC(Qp, Tl, RH, vcmax, jmax, Rd, Bet0, Bet1, Catm, O2, theta,StomWS,ws);

		REAL(GsV)[i] = tmp.Gs;
		REAL(ASSV)[i] = tmp.Assim;    
		REAL(CiV)[i] = tmp.Ci;
	}

	SET_VECTOR_ELT(lists,0,GsV);
	SET_VECTOR_ELT(lists,1,ASSV);
	SET_VECTOR_ELT(lists,2,CiV);
	SET_STRING_ELT(names,0,mkChar("Gs"));
	SET_STRING_ELT(names,1,mkChar("Assim"));
	SET_STRING_ELT(names,2,mkChar("Ci"));
	setAttrib(lists,R_NamesSymbol,names);
	UNPROTECT(5);   
	return(lists);
}



/* Solubility of CO2 and O2 */

/* This function returns the solubility of CO2 at temperature t relative to CO2 */
/* solubility at 25C it does this by using a polynomial which has been fitted to */
/* experimental data. */

/* Function result units: micro mol mol^-1 */
/* Function found: */
/* Plant cell and Environment, (1991) 14, 729-739. */
/* Modification of the response of photosynthetic activity to */
/* rising temperature by atmospheric CO2 concentrations: Has its */
/* importance been underestimated? */

