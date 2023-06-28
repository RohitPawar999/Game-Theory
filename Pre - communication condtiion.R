#Create a Payoff matrix
payoff_mat<- matrix(vector("list", 4), nrow = 2, ncol = 2)
# intialize payoff values 

#If both the husband and wife decided to go for football
payoff_mat[[1, 1]] <- c(2,1)

#if Husbant want Football but wife want shopping 
payoff_mat[[1, 2]] <- c(0,0)

#if Husband choose shopping and wife choose football
payoff_mat[[2, 1]] <- c(0,0)

#if both choose shopping 
payoff_mat[[2, 2]] <- c(1,2)

#intializing the row names and col names 
row_names <- c("Football", "Shopping")
col_names <- c("Football", "Shopping")
rownames(payoff_mat) <- row_names
colnames(payoff_mat) <- col_names

#printing the column name and printing the payoff matrix 
cat("       ", paste(colnames(payoff_mat), collapse = "     "), "\n")
for (i in 1:nrow(payoff_mat)) {
  cat(rownames(payoff_mat)[i], " ", paste(payoff_mat[i, ], collapse = "   "), "\n")
}

# max_col represent the max value of payoff for wife
#c represent the index correspond to min_col for wife
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

# max_row represent the max value of payoff for husband
#c represent the index correspond to min_col for husband
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
print("[Husband , Wife]")
print(payoff_mat[r,c])