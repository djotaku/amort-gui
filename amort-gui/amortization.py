__author__ = "Eric Mesa"
__version__ = "v2.0"
__license__ = "GNU GPL v3.0"
__copyright__ = "(c) 2010 Eric Mesa"
__email__ = "ericsbinaryworld at gmail dot com"

#TODO
#need to fix so it uses eral numbers instead of integers
#also add comments in the principal file

import csv,sys

def printtoscreen(P,i,n,MonthlyPayment,totalPrincipal,totalInterest,totalPayment,principaldict):

    print "Loan Amount:", P
    print "Annual Interest:",  i*12*100
    print "Payment: %10.2f\n" % MonthlyPayment

    period = 1
    #generate titles
    print "\t Payment \t Principal \t Interest \t Extra Principal  Balance"

    #generate amortization table
    while period < n+1:
        intpayment = (P*i)
        if period == n:
            MonthlyPayment = P + intpayment

        #total stuff
        totalPrincipal = totalPrincipal + (MonthlyPayment - intpayment) + int(principaldict[period])
        totalInterest = totalInterest + intpayment
        totalPayment = totalPayment + MonthlyPayment + int(principaldict[period])

        #this should handle finishing early because of extra interest payments
        if P < MonthlyPayment:
            MonthlyPayment = P + intpayment
            P = P - (MonthlyPayment - intpayment) - int(principaldict[period])
            print "%d \t %10.2f \t %10.2f \t %10.2f \t %10.2f \t %10.2f"% (period, MonthlyPayment, MonthlyPayment-intpayment, intpayment, int(principaldict[period]),P)
            break

        P = P - (MonthlyPayment - intpayment) - int(principaldict[period])

        print "%d \t %10.2f \t %10.2f \t %10.2f \t %10.2f \t %10.2f"% (period, MonthlyPayment, MonthlyPayment-intpayment, intpayment, int(principaldict[period]),P) 
        period = period + 1

    #generate totals
    print "Totals \t %10.2f \t %10.2f \t %10.2f" % (totalPayment, totalPrincipal, totalInterest)

def makecsv(P,i,n,MonthlyPayment,totalPrincipal,totalInterest,totalPayment,principaldict):
    #create itereable
    csvfinal = []
    csvthisime = []
    period = 1
    
    #generate titles
    csvthistime = [None, "Payment","Principal","Interest","Extra Principal", "Balance"]
    csvfinal.append(csvthistime)
    
    #generate amortization table
    while period < n+1:
        intpayment = (P*i)
        if period == n:
            MonthlyPayment = P + intpayment

        #total stuff
        totalPrincipal = totalPrincipal + (MonthlyPayment - intpayment) + int(principaldict[period])
        totalInterest = totalInterest + intpayment
        totalPayment = totalPayment + MonthlyPayment + int(principaldict[period])

        #this should handle finishing early because of extra interest payments
        if P < MonthlyPayment:
            MonthlyPayment = P + intpayment
            P = P - (MonthlyPayment - intpayment) - int(principaldict[period])
            csvfinal.append([period, MonthlyPayment, MonthlyPayment-intpayment, intpayment, int(principaldict[period]),P])
            break

        P = P - (MonthlyPayment - intpayment) - int(principaldict[period])

        csvfinal.append([period, MonthlyPayment, MonthlyPayment-intpayment, intpayment, int(principaldict[period]),P]) 
        period = period + 1

    #generate totals
    csvfinal.append([None,totalPayment, totalPrincipal, totalInterest])

    writer = csv.writer(open("amort.csv", "wb"))
    writer.writerows(csvfinal)

def fromgui(output,P_in,i_in,n_in):

  ##################setup variables#####################
  P=int(P_in)
  i=float(i_in)/12
  n=int(n_in)
  MonthlyPayment = (P*i)/(1-pow((1+i),-n))
  (totalPrincipal,totalInterest,totalPayment) = (0,0,0)
  #####################################################
  
  
  ##read in the extra principal amounts###
  extra = []
  count = 0
  f = open('extraprincipal','r')
  for line in f:
      extra.append(line)
      count = count + 1
  f.close()

  for number in range(0,n-count):
      extra.append(0)

  dictkey = range(1,361)

  dictitems = zip(dictkey,extra)

  principaldict = dict(dictitems)
  ####################################

  if output == 'csv':
      makecsv(P,i,n,MonthlyPayment,totalPrincipal,totalInterest,totalPayment,principaldict)
  elif output == 'screen':
      printtoscreen(P,i,n,MonthlyPayment,totalPrincipal,totalInterest,totalPayment,principaldict)
  return 0