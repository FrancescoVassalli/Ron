
template<class T>
queue<T> GetAll(std::string file,std::string objectname){//txt file containing the names of files to process and the name of the thing to get from the file
	using namespace std;
	ifstream inFile (file.c_str()); 
	string intemp;
	queue<std::string> someRuns;

	while(inFile>>intemp)
	{
		someRuns.push(intemp);
		cout<<"Run: "<<intemp<<endl; //you can turn this off 
	}
	inFile.close();
	const unsigned int SIZE = someRuns.size();
	queue<T> hq;
	int looptemp=0;
	while(!someRuns.empty()){
		TFile *input = new TFile(someRuns.front().c_str()); //this will mem leak 
		someRuns.pop();
		T maintree = (T) input->Get(objectname.c_str());
		hq.push(maintree);
	}
	return hq;
}

void GetAllHists(){
	
}