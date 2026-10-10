class Loc {
  final String best, water, tip;
  final List<String> watch;
  const Loc(this.best, this.water, this.watch, this.tip);
}

const locations = <String, Loc>{
  'Forest': Loc('Spring to autumn', 'Streams are common. Always filter or boil.',
      ['Ticks and insects', 'Falling branches in wind', 'Unmarked trails'],
      'Camp away from dead trees and at least 60 m from water.'),
  'Mountains': Loc('Late spring to early autumn',
      'Melt streams. Filter before drinking.',
      ['Sudden weather changes', 'Altitude sickness', 'Cold nights'],
      'Start hikes early and leave exposed ridges by afternoon.'),
  'Lake or river': Loc('Summer and early autumn', 'Plenty, but must be treated.',
      ['Flash floods', 'Cold water shock', 'Mosquitoes'],
      'Pitch above the high-water line, never in a dry riverbed.'),
  'Desert': Loc('Cooler months',
      'Scarce. Carry at least 4 L per person per day.',
      ['Heat stroke', 'Cold nights', 'Snakes and scorpions'],
      'Rest in shade at midday and travel at dawn and dusk.'),
  'Beach': Loc('Late spring to early autumn',
      'None. Bring all your drinking water.',
      ['Tides and currents', 'Strong sun and wind'],
      'Camp above the tide line and check tide times.'),
};
