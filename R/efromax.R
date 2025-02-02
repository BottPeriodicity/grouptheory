# WARNING - Generated by {fusen} from dev/flat_first.Rmd: do not edit by hand

#' EfromAX
#'
#' @param A,X,silent The Cayley table "A" of a group and its list of up-to-conjugacy-subgroups "X" and a parameter.
#' 
#' @return
#' The adjacency matrix of its up-to-conjugacy-subgroups, where i is linked to j if there is a subgroup of conjugacy-type i that is an immediate subgroup of some subgroup of conjugacy-type j. By immediate subgroup we mean that there is no intermediate subgroup in between.
#' @export
#'
EfromAX=function(A,X,silent=T){
  I=Inverse(A); nn=length(X); ind=1:nn; S=c(); SS=matrix(nrow=nn,ncol=nn)
  fuu=function(j){return(Conjugates(A,I,X[[j]][-c(1:3)]))}
  TT=parallel::mclapply(ind,fuu,mc.cores=parallel::detectCores())
  if(silent==F){print("ok")}
  for(i in ind){
    Ti=rbind(TT[[i]]); l1=ncol(Ti); lc=nrow(Ti)
    fu=function(j){
      out=0
      w2=X[[j]][-c(1:3)]; l2=length(w2)
      if(l1<l2){
        for(s in 1:lc){
          if(length(intersect(Ti[s,],w2))==l1){out=1;break}
        }
      }
      return(out)
    }
    S=rbind(S,unlist(parallel::mclapply(ind,fu,mc.cores=parallel::detectCores())))
    if(silent==F){print(i/nn)}
  }
  for(i in ind){
    for(j in ind){
      o=F
      if(S[i,j]==1){
        o=T
        for(k in ind[-c(i,j)]){
          if(S[i,k]==1 & S[k,j]==1){o=F;break}
        }
      }
      SS[i,j]=o
    }
  }
  return(SS)
}
