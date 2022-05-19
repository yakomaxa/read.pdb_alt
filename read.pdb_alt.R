require(bio3d)

read.pdb_alt=function(file=NULL){
  pdb=read.pdb(file = file,rm.alt = F)
  pdb_new=pdb
  resnos=unique(pdb$atom$resno[which(!is.na(pdb$atom$alt))])
  if(length(resnos)>=0){
    indexes=c()
    for (resno in resnos){
      ind_resno=which(pdb$atom$resno==resno)
      youngest_alt=na.omit(unique(pdb$atom$alt[ind_resno]))[1]
      print(paste0("Using the youngest alt=",youngest_alt," for resno=",resno))
      ind_resno_youngest_alt=unique(which( ( is.na(pdb$atom$alt)| pdb$atom$alt==youngest_alt )& pdb$atom$resno==resno))
      indexes=c(indexes,ind_resno_youngest_alt)
      }
    ind_noalt=which(is.na(pdb$atom$alt) & !is.element(pdb$atom$resno,resnos))
    index_all=sort(c(indexes,ind_noalt))
    pdb_new$atom=pdb$atom[index_all,]
    pdb_new$xyz=pdb$xyz[atom2xyz(index_all)]
  }
  return(pdb_new)
}