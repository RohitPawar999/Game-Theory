#Create a Payoff matrix
payoff_mat<- matrix(vector("list", 4), nrow = 2, ncol = 2)
# intialize payoff values 

#If both the companies collaborate 
payoff_mat[[1, 1]] <- c(1,1)

#if Apple Collaborate but samsung not
payoff_mat[[1, 2]] <- c(0,2)

#if Apple do not collaborate but samsung collaborate
payoff_mat[[2, 1]] <- c(2,0)

#if both companies not collaborate
payoff_mat[[2, 2]] <- c(2,2)

#intializing the row names and col names 
row_names <- c("Collaborate", "Pursue Proprietary")
col_names <- c("Collaborate", "Pursue Proprietary")
rownames(payoff_mat) <- row_names
colnames(payoff_mat) <- col_names

#printing the column name and printing the payoff matrix 
cat("       ", paste(colnames(payoff_mat), collapse = "     "), "\n")
for (i in 1:nrow(payoff_mat)) {
  cat(rownames(payoff_mat)[i], " ", paste(payoff_mat[i, ], collapse = "   "), "\n")
}

# max_col represent the max value of payoff for samsung
#c represent the index correspond to min_col for samsung
max_col<-payoff_mat[[1,1]][2]
c<-0
for(i in 1:nrow(payoff_mat)) {
   for(j in 1:ncol(payoff_mat)){
     if(max_col <=(payoff_mat[[i,j]][2]))
     {
       max_col<-payoff_mat[[i,j]][2]
       c<-j
     }
     
   }
}

# max_row represent the max value of payoff for Apple
#c represent the index correspond to min_col for Apple
max_row<-payoff_mat[[1,1]][1]
r<-0
for(i in 1:ncol(payoff_mat)) {
  for(j in 1:nrow(payoff_mat)){
    if(max_row <=(payoff_mat[[i,j]][1]))
    {
      max_row<-payoff_mat[[i,j]][1]
      r<-j
    }
    
  }
}
# printing the nash equilibrium 
print("Nash Equilibrium")
print("[Apple , samsung]")
print(payoff_mat[r,c])





