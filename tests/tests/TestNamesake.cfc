component extends="testbox.system.BaseSpec" {
	function run(testResults, testBox) {
		guidesDir = ExpandPath("../guides/en");
		guides = directoryList(guidesDir, false, "array").map(function(path) {
			return getFileFromPath(path).replace('.md','');
		});
		// temporary: should be removed later
		index.components = ["application-cfc"];

		describe("JSON Related Tests", function() {
			it("there should be no guides and function/tag with the same name", function() {
				for(guide in guides) {
					if (guide is 'application') {
						continue;
					}
					expect(fileExists('../data/en/#guide#.json')).toBeFalse('You cannot create with a guide with the name "#guide#" because there is already a doc with the same name.<br />Tip: Do not hesitate to rename your guide. The title shown in navigation is the title you write into the first line ;-)');
				}
			});
		});
	}
}
