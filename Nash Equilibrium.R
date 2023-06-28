#Create a Payoff matrix
payoff_mat<- matrix(vector("list", 4), nrow = 2, ncol = 2)
#intialize matrix with payoff values

#if both prisoner 1 and prisoner 2 cooprate
payoff_mat[[1, 1]] <- c(3,3) 

#if  prisoner 1 cooprate and prisoner 2 defeat
payoff_mat[[1, 2]] <- c(0,5) 

#if  prisoner 1 defeat and prisoner 2 cooprate
payoff_mat[[2, 1]] <- c(5,0)

#if both prisoner 1 and prisoner 2 defeat
payoff_mat[[2, 2]] <- c(1,1)

#intializing the row names and column names 
row_names <- c("Cooprate", "defeat")
col_names <- c("Cooprate", "defeat")
rownames(payoff_mat) <- row_names
colnames(payoff_mat) <- col_names

#printing the payoff matrix
cat("       ", paste(colnames(payoff_mat), collapse = "     "), "\n") #print column name
for (i in 1:nrow(payoff_mat)) {
  cat(rownames(payoff_mat)[i], " ", paste(payoff_mat[i, ], collapse = "   "), "\n")
}

# min_col represent the min value of payoff for prisoner 2
#c represent the index correspond to min_col for prisoner 2
min_col<-payoff_mat[[1,1]][2]
c<-0
for(i in 1:nrow(payoff_mat)) {
  for(j in 1:ncol(payoff_mat)){
    if(min_col>=(payoff_mat[[i,j]][2]))
    {
      min_col<-payoff_mat[[i,j]][2]
      c<-j
    }
    
  }
}
# min_row represent the min value of payoff for prisoner 1
# r represent the index correspond to min_col for prisoner 1
min_row<-payoff_mat[[1,1]][1]
r<-0
for(i in 1:ncol(payoff_mat)) {
  for(j in 1:nrow(payoff_mat)){
    if(min_row <=(payoff_mat[[i,j]][1]))
    {
      min_row<-payoff_mat[[i,j]][1]
      r<-j
    }
    
  }
}
print("Nash Equilibrium")
print("[Prisoner 1 , Prisoner 2]")
print(payoff_mat[r,c])

