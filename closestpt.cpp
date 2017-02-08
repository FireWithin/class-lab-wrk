#include <bits/stdc++.h>
using namespace std;

#define f first
#define s second
#define pb push_back

struct pt{
	float x;
	float y;
	pt(float a, float b) : x(a), y(b) {}
};


float dis(pt a, pt b){
	return sqrt((a.x-b.x)*(a.x-b.x)+(a.y-b.y)*(a.y-b.y));
}

vector <pt> vct;
vector <pt> tmp;

int n;

bool compx(const pt &left, const pt &right){
	return left.x < right.x;
}

bool compy(const pt &left, const pt &right){
	return left.y < right.y;
}

float closest(int lo, int hi){
	if(lo==hi){
		return 1e6;
	}
	if(lo+1==hi){
		return dis(vct[lo], vct[hi]);	
	}
	int md = (lo+hi)/2;
	float d1 = closest(lo,md-1);
	float d2 = closest(md+1,hi);
	float dl = min(d1,d2);
	int c1 = md;
	tmp.clear();
	while(1){
		if(c1==hi+1) break;
		if(vct[c1].x-vct[md].x>dl) break;
		tmp.pb(vct[c1++]);
	}
	c1 = md-1;
	while(1){
		if(c1==lo-1) break;
		if(vct[md].x-vct[c1].x>dl) break;
		tmp.pb(vct[c1--]);
	}
	float d = 1e6;
	sort(tmp.begin(), tmp.end(), compy);
	for(int i = 0; i < tmp.size(); i++){
		for(int j = i+1; j < min(i+8,(int)tmp.size()); j++){
			d = min(d,dis(vct[i], vct[j]));
		}
	}
	return min(d,dl);
}


main(){
	float xx, yy;
	cin >> n;
	for(int i = 0; i < n; i++){
		cin >> xx >> yy;
		vct.pb(pt(xx,yy));
	}
	sort(vct.begin(), vct.end(), compx);
	//for(int i = 0; i < n; i++) cout << vct[i].x << ' ' << vct[i].y << endl;
	float ans = closest(0,n-1);
	cout << ans << endl;
}
