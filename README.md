# Power-Plant-Emissions-and-Meteorology
**This is a catch all for much of the work I did with Dr. Tracey Holloway on correlating power plant emissions and meteorology over the past decade in the Eastern US. **


Included in this repository is...actually now that I think about it you might not even have public access to this stuff anymore. 

Nope, I just checked; it's all still there thank goodness. https://ampd.epa.gov/ampd/

All of the data in the state and region emissions excel files are from the clean air markets program data available from the EPA. SO2, CO2, NOx and energy loads are given and aggregated. There is tons of information in these data sets alone, and you can get right down to the stack from the EPA. All the data is continuous as part of the state implementation plans (SIPs) from pretty much every major power producer in the United States. There are many more parameters to grab from the database, and now I do all of that stuff from a prompt query, but back in the day it was downloading csv files from their gui and working them up in excel. I'd do it in python nowadays but I was just a freshman back then :D.

Also included in an excel file of the North American Regional Reanalysis meteorology from the states and regions in question. The script, which is on a computer back at the Center for Sustainability and the Global Environment (SAGE) was written in NCL and takes the geographic center (or really any lat/lon) and grabs the 2m above the ground temperature average at that point for the 8 hour period (daytime). NARR is a regional reanalysis, so it takes the historical data from weather stations and then uses models to fill in the gaps. You can grab pretty much any point any time back to something like 1973. They go back and reupdate when the models improve but for things like center state ambient temperature these things don't change much at all.

The premise behind the research is simple. The assumption is that people use more electricity in the summer time when the temperature rises. This is due to increased air conditioning turn-on and increased heat pumping by the air conditioners that are on. The result is a greater demand on power plants, which means there should be a characteristic and corresponding increase in emissions when the temperature rises (independent of any chemistry effects for secondary emissions; we're talking just primaries). Any two sets of emissions and meteorology should be able to see this trend, no matter where they come from. We got the general result we expected in a beautiful way, but it asked even more interesting questions.

We find that the trend is nonlinear. That is there is an increasing amount of emissions increase with temperature. This makes sense for several reasons (my colleague David Abel is currently getting his PhD continuing this work and we submitted a paper together): we have to turn on dirtier power plants, one that would normally be off because they are dirtier, when there is extreme demand, such as when there is high temperture, and secondly the behavioral effects are nonlinear. People in Florida turn on their air conditioning at a much different time than the people in Massachusetts, but power flows across statelines, usually dictated by regional ISO (independent service operators). I've had a good time at Madison Gas and Electric understanding power trading and ISOs. 

All of the data is pretty straightforward, the analysis is clear, and yet it took years to submit and resubmit papers. This is the reason I couldn't remain in academia. Now, with changing admiistrations, changing laws, and changing climate, I'd much rather help engineer away the problems of emissions than characterize their behavior. Though this is still valuable work.

I presented this work in an oral presentation at the 2016 American Meteorological Society Annual meeting in New Orleans. Message me with any questions. 
