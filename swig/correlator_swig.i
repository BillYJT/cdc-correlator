/* -*- c++ -*- */

#define CORRELATOR_API

%include "gnuradio.i"           // the common stuff

//load generated python docstrings
%include "correlator_swig_doc.i"

%{
#include "correlator/corr_est.h"
%}

%include "correlator/corr_est.h"
GR_SWIG_BLOCK_MAGIC2(correlator, corr_est);
